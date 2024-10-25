import React, { useState, useEffect } from 'react';
import axios from 'axios';
import * as XLSX from 'xlsx'; // Import xlsx library for Excel report
import './Persons.css'; // Reuse the same CSS for styling

const Needs = () => {
  const [needs, setNeeds] = useState([]);
  const [houses, setHouses] = useState([]);
  const [families, setFamilies] = useState([]);
  const [individuals, setIndividuals] = useState([]);
  const [searchQuery, setSearchQuery] = useState('');
  const [isEditing, setIsEditing] = useState(null);
  const [startDate, setStartDate] = useState('');
  const [endDate, setEndDate] = useState('');
  const [newNeed, setNewNeed] = useState({
    food_aid: false,
    medicine: false,
    furniture: false,
    clothes: false,
    cleaning_supplies: false,
    house_id: '',
    family_id: '',
    individual_id: '',
    fulfilled: false,
    fulfilled_date: '', // Include fulfilled_date in state
  });
  const [showModal, setShowModal] = useState(false);
  const [fulfilledCounts, setFulfilledCounts] = useState({
    totalFulfilled: 0,
    foodAid: 0,
    medicine: 0,
    furniture: 0,
    clothes: 0,
    cleaningSupplies: 0,
    byHouse: {},
    byFamily: {},
    byIndividual: {},
  });

  useEffect(() => {
    fetchData();
  }, []);

  // Fetch all related data: needs, houses, families, individuals
  const fetchData = () => {
    axios.all([
      axios.get('http://localhost:5000/needs'),
      axios.get('http://localhost:5000/houses'),
      axios.get('http://localhost:5000/families'),
      axios.get('http://localhost:5000/individuals')
    ])
    .then(axios.spread((needsRes, housesRes, familiesRes, individualsRes) => {
      setNeeds(needsRes.data);
      setHouses(housesRes.data);
      setFamilies(familiesRes.data);
      setIndividuals(individualsRes.data);
      calculateFulfilledCounts(needsRes.data);
    }))
    .catch(error => console.error('Error fetching data:', error));
  };

  // Calculate fulfilled needs counts
  const calculateFulfilledCounts = (needsData) => {
    const counts = {
      totalFulfilled: 0,
      foodAid: 0,
      medicine: 0,
      furniture: 0,
      clothes: 0,
      cleaningSupplies: 0,
      byHouse: {},
      byFamily: {},
      byIndividual: {},
    };

    needsData.forEach(need => {
      if (need.fulfilled) {
        counts.totalFulfilled++;
        if (need.food_aid) counts.foodAid++;
        if (need.medicine) counts.medicine++;
        if (need.furniture) counts.furniture++;
        if (need.clothes) counts.clothes++;
        if (need.cleaning_supplies) counts.cleaningSupplies++;

        // Count by house
        if (need.house_id) {
          counts.byHouse[need.house_id] = (counts.byHouse[need.house_id] || 0) + 1;
        }

        // Count by family
        if (need.family_id) {
          counts.byFamily[need.family_id] = (counts.byFamily[need.family_id] || 0) + 1;
        }

        // Count by individual
        if (need.individual_id) {
          counts.byIndividual[need.individual_id] = (counts.byIndividual[need.individual_id] || 0) + 1;
        }
      }
    });

    setFulfilledCounts(counts);
  };

  // Handle form input changes
  const handleInputChange = (e) => {
    const { name, value, type, checked } = e.target;
    const inputValue = type === 'checkbox' ? checked : value;
    setNewNeed(prevState => ({ ...prevState, [name]: inputValue }));
  };

  // Add a new need
  const handleAddNeed = () => {
    const formattedNeed = {
      ...newNeed,
      house_id: newNeed.house_id || null,
      family_id: newNeed.family_id || null,
      individual_id: newNeed.individual_id || null,
      fulfilled_date: newNeed.fulfilled ? new Date() : null, // Set fulfilled_date if fulfilled
    };

    axios.post('http://localhost:5000/needs', formattedNeed)
      .then(() => {
        fetchData();
        setShowModal(false);
        setNewNeed({
          food_aid: false,
          medicine: false,
          furniture: false,
          clothes: false,
          cleaning_supplies: false,
          house_id: '',
          family_id: '',
          individual_id: '',
          fulfilled: false,
          fulfilled_date: '',
        });
      })
      .catch(error => console.error('Error adding need:', error));
  };

  // Open and close modal
  const openModal = () => setShowModal(true);
  const closeModal = () => setShowModal(false);

  // Edit an existing need
  const handleEditNeed = (need) => {
    setIsEditing(need.id);
    setNewNeed(need);
    setShowModal(true);
  };

  // Save changes to an existing need
  const handleSaveNeed = (needId) => {
    const formattedNeed = {
      ...newNeed,
      fulfilled_date: newNeed.fulfilled ? new Date() : null,
    };

    axios.put(`http://localhost:5000/needs/${needId}`, formattedNeed)
      .then(() => {
        fetchData();
        setIsEditing(null);
        closeModal();
      })
      .catch(error => console.error('Error saving need:', error));
  };

  // Delete a need
  const handleDeleteNeed = (needId) => {
    axios.delete(`http://localhost:5000/needs/${needId}`)
      .then(() => fetchData())
      .catch(error => console.error('Error deleting need:', error));
  };

  // Toggle fulfillment status and set fulfilled_date
  const handleToggleFulfilled = (needId, currentStatus) => {
    const newStatus = !currentStatus;
    const fulfilledDate = newStatus ? new Date() : null;

    axios.patch(`http://localhost:5000/needs/${needId}/fulfill`, { 
      fulfilled: newStatus, 
      fulfilled_date: fulfilledDate 
    })
    .then(() => fetchData())
    .catch(error => console.error('Error updating fulfillment:', error));
  };

  // Filter needs by search query or date range
  const filteredNeeds = needs.filter(need => {
    const matchesQuery = searchQuery ? (
      (need.house_id && need.house_id.toString().includes(searchQuery)) ||
      (need.family_id && need.family_id.toString().includes(searchQuery)) ||
      (need.individual_id && need.individual_id.toString().includes(searchQuery))
    ) : true;

    // Adjust endDate to include the entire end day
    const adjustedEndDate = endDate ? new Date(new Date(endDate).setHours(23, 59, 59, 999)) : null;

    const withinDateRange = (!startDate || new Date(need.fulfilled_date) >= new Date(startDate)) &&
                            (!adjustedEndDate || new Date(need.fulfilled_date) <= adjustedEndDate);

    return matchesQuery && withinDateRange;
  });

  // Generate report based on filtered needs and date range
  const generateReport = () => {
    const worksheetData = [
      ['نوع الاحتياج', 'تاريخ الاكتمال', 'المنزل', 'العائلة', 'الفرد', 'عدد المرات المكتملة'],
      ...filteredNeeds.map(need => [
        need.food_aid ? 'حصة غذائية' : need.medicine ? 'أدوية' : need.furniture ? 'فرش' : need.clothes ? 'ملابس' : 'مواد تنظيف',
        need.fulfilled_date || 'N/A',
        houses.find(h => h.id === need.house_id)?.house_label || 'N/A',
        families.find(f => f.id === need.family_id)?.family_head || 'N/A',
        individuals.find(i => i.id === need.individual_id)?.name || 'N/A',
        '1' // Represents one fulfilled instance
      ]),
    ];

    const workbook = XLSX.utils.book_new();
    const worksheet = XLSX.utils.aoa_to_sheet(worksheetData);
    XLSX.utils.book_append_sheet(workbook, worksheet, 'تقرير الاحتياجات');

    XLSX.writeFile(workbook, 'تقرير_الاحتياجات.xlsx');
  };

  return (
    <div className="persons-container" style={{ direction: 'rtl' }}>
      <h1>الاحتياجات</h1>

      {/* Fulfilled needs statistics */}
      <div className="fulfilled-stats">
        <h2>إحصائيات الاحتياجات المكتملة</h2>
        <p>إجمالي الاحتياجات المكتملة: {fulfilledCounts.totalFulfilled}</p>
        <p>حصة غذائية مكتملة: {fulfilledCounts.foodAid}</p>
        <p>أدوية مكتملة: {fulfilledCounts.medicine}</p>
        <p>فرش مكتملة: {fulfilledCounts.furniture}</p>
        <p>ملابس مكتملة: {fulfilledCounts.clothes}</p>
        <p>مواد تنظيف مكتملة: {fulfilledCounts.cleaningSupplies}</p>
      </div>

      {/* Fulfilled needs by house, family, and individual */}
      <div className="fulfilled-stats">
        <h2>عدد الاحتياجات المكتملة حسب</h2>
        <h3>المنزل</h3>
        {Object.entries(fulfilledCounts.byHouse).map(([houseId, count]) => (
          <p key={houseId}>{houses.find(h => h.id === parseInt(houseId))?.house_label || 'N/A'}: {count}</p>
        ))}
        <h3>العائلة</h3>
        {Object.entries(fulfilledCounts.byFamily).map(([familyId, count]) => (
          <p key={familyId}>{families.find(f => f.id === parseInt(familyId))?.family_head || 'N/A'}: {count}</p>
        ))}
        <h3>الفرد</h3>
        {Object.entries(fulfilledCounts.byIndividual).map(([individualId, count]) => (
          <p key={individualId}>{individuals.find(i => i.id === parseInt(individualId))?.name || 'N/A'}: {count}</p>
        ))}
      </div>

      {/* Date range filter */}
      <div className="date-filter">
        <label>من:</label>
        <input
          type="date"
          value={startDate}
          onChange={(e) => setStartDate(e.target.value)}
          className="form-input"
        />
        <label>إلى:</label>
        <input
          type="date"
          value={endDate}
          onChange={(e) => setEndDate(e.target.value)}
          className="form-input"
        />
        <button onClick={generateReport} className="form-button">
          تحميل تقرير الاحتياجات المكتملة
        </button>
      </div>

      {/* Add New Need Button */}
      <button onClick={openModal} className="form-button add-button">
        إضافة احتياج جديد
      </button>

      {/* Modal for adding/editing need */}
      {showModal && (
        <div className="modal-overlay">
          <div className="modal-card">
            <h2>{isEditing ? 'تعديل الاحتياج' : 'إضافة احتياج جديد'}</h2>
            {/* Need form inputs */}
            <div className="form-section">
              <label>
                <input
                  type="checkbox"
                  name="food_aid"
                  checked={newNeed.food_aid}
                  onChange={handleInputChange}
                />
                حصة غذائية
              </label>
              <label>
                <input
                  type="checkbox"
                  name="medicine"
                  checked={newNeed.medicine}
                  onChange={handleInputChange}
                />
                أدوية
              </label>
              <label>
                <input
                  type="checkbox"
                  name="furniture"
                  checked={newNeed.furniture}
                  onChange={handleInputChange}
                />
                فرش
              </label>
              <label>
                <input
                  type="checkbox"
                  name="clothes"
                  checked={newNeed.clothes}
                  onChange={handleInputChange}
                />
                ملابس
              </label>
              <label>
                <input
                  type="checkbox"
                  name="cleaning_supplies"
                  checked={newNeed.cleaning_supplies}
                  onChange={handleInputChange}
                />
                مواد تنظيف
              </label>
            </div>
            
            {/* House, family, individual selection */}
            <div className="form-section">
              <label>
                المنزل
                <select
                  name="house_id"
                  value={newNeed.house_id}
                  onChange={handleInputChange}
                  className="form-input"
                >
                  <option value="">اختر المنزل</option>
                  {houses.map(house => (
                    <option key={house.id} value={house.id}>{house.house_label}</option>
                  ))}
                </select>
              </label>

              <label>
                العائلة
                <select
                  name="family_id"
                  value={newNeed.family_id}
                  onChange={handleInputChange}
                  className="form-input"
                >
                  <option value="">اختر العائلة</option>
                  {families.map(family => (
                    <option key={family.id} value={family.id}>{family.family_head}</option>
                  ))}
                </select>
              </label>

              <label>
                الفرد
                <select
                  name="individual_id"
                  value={newNeed.individual_id}
                  onChange={handleInputChange}    
                  className="form-input"
                >
                  <option value="">اختر الفرد</option>
                  {individuals.map(individual => (
                    <option key={individual.id} value={individual.id}>{individual.name}</option>
                  ))}
                </select>
              </label>

              <label>
                <input
                  type="checkbox"
                  name="fulfilled"
                  checked={newNeed.fulfilled}
                  onChange={handleInputChange}
                />
                مكتملة
              </label>
            </div>

            <div className="modal-actions">
              <button
                type="button"
                onClick={isEditing ? () => handleSaveNeed(isEditing) : handleAddNeed}
                className="save-button"
              >
                {isEditing ? 'حفظ' : 'إضافة'}
              </button>
              <button type="button" onClick={closeModal} className="cancel-button">
                إلغاء
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Needs table */}
      <h2>قائمة الاحتياجات</h2>
      <table className="persons-table">
        <thead>
          <tr>
            <th>حصة غذائية</th>
            <th>أدوية</th>
            <th>فرش</th>
            <th>ملابس</th>
            <th>مواد تنظيف</th>
            <th>المنزل</th>
            <th>العائلة</th>
            <th>الفرد</th>
            <th>مكتملة</th>
            <th>تاريخ الاكتمال</th>
            <th>إجراءات</th>
          </tr>
        </thead>
        <tbody>
          {filteredNeeds.map(need => (
            <tr key={need.id}>
              <td>{need.food_aid ? 'نعم' : 'لا'}</td>
              <td>{need.medicine ? 'نعم' : 'لا'}</td>
              <td>{need.furniture ? 'نعم' : 'لا'}</td>
              <td>{need.clothes ? 'نعم' : 'لا'}</td>
              <td>{need.cleaning_supplies ? 'نعم' : 'لا'}</td>
              <td>{houses.find(h => h.id === need.house_id)?.house_label || 'N/A'}</td>
              <td>{families.find(f => f.id === need.family_id)?.family_head || 'N/A'}</td>
              <td>{individuals.find(i => i.id === need.individual_id)?.name || 'N/A'}</td>
              <td>{need.fulfilled ? 'نعم' : 'لا'}</td>
              <td>{need.fulfilled_date ? new Date(need.fulfilled_date).toLocaleDateString('ar-EG') : 'N/A'}</td>
              <td>
                <button onClick={() => handleEditNeed(need)}>تعديل</button>
                <button onClick={() => handleDeleteNeed(need.id)}>حذف</button>
                <button onClick={() => handleToggleFulfilled(need.id, need.fulfilled)}>
                  {need.fulfilled ? 'إلغاء' : 'اكتمال'}
                </button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Needs;
