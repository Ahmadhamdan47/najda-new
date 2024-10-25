import React, { useState, useEffect } from 'react';
import axios from 'axios';
import * as XLSX from 'xlsx'; // Import the xlsx library
import './Persons.css'; // Reuse the same CSS for consistency

const Houses = () => {
  const [houses, setHouses] = useState([]);
  const [searchQuery, setSearchQuery] = useState('');
  const [isEditing, setIsEditing] = useState(null);
  const [newHouse, setNewHouse] = useState({
    house_number: '',
    person_contacted: '',
    total_people: '',
    under_two_years: '',
    under_thirteen_years: '',
    over_thirteen_years: '',
    current_residence: '',
    displacement_location: '',
    furnished_home: false,
    gas: false,
  });

  useEffect(() => {
    fetchHouses();
  }, []);
  
  const fetchHouses = () => {
    axios.get('http://localhost:5000/houses')
      .then(response => {
        setHouses(response.data);
      })
      .catch(error => console.error('Error fetching houses:', error));
  };

  const handleInputChange = (e) => {
    const { name, value, type, checked } = e.target;
    const inputValue = type === 'checkbox' ? checked : value;
    setNewHouse(prevState => ({ ...prevState, [name]: inputValue }));
  };

  const handleAddHouse = () => {
    axios.post('http://localhost:5000/houses', newHouse)
      .then(() => {
        fetchHouses();
        setNewHouse({
          house_number: '',
          person_contacted: '',
          total_people: '',
          under_two_years: '',
          under_thirteen_years: '',
          over_thirteen_years: '',
          current_residence: '',
          displacement_location: '',
          furnished_home: false,
          gas: false,
        });
      })
      .catch(error => console.error('Error adding house:', error));
  };

  const handleEditHouse = (house) => {
    setIsEditing(house.id);
    setNewHouse(house);
  };

  const handleSaveHouse = (houseId) => {
    axios.put(`http://localhost:5000/houses/${houseId}`, newHouse)
      .then(() => {
        fetchHouses();
        setIsEditing(null);
      })
      .catch(error => console.error('Error saving house:', error));
  };

  const handleDeleteHouse = (houseId) => {
    axios.delete(`http://localhost:5000/houses/${houseId}`)
      .then(() => fetchHouses())
      .catch(error => console.error('Error deleting house:', error));
  };

  const generateReport = () => {
    // Define Arabic column headers for the Excel report
    const worksheetData = [
      ['رقم المنزل', 'الشخص الذي تم الاتصال به', 'عدد الأشخاص', 'أقل من سنتين', 'أقل من 13 سنة', 'أكبر من 13 سنة', 'مكان الإقامة الحالي', 'مكان النزوح', 'منزل مفروش', 'غاز'],
      ...houses.map(house => [
        house.house_number || 'N/A',
        house.person_contacted || 'N/A',
        house.total_people || '0',
        house.under_two_years || '0',
        house.under_thirteen_years || '0',
        house.over_thirteen_years || '0',
        house.current_residence || 'N/A',
        house.displacement_location || 'N/A',
        house.furnished_home ? 'نعم' : 'لا',
        house.gas ? 'نعم' : 'لا',
      ]),
    ];

    // Create a new workbook and add the worksheet
    const workbook = XLSX.utils.book_new();
    const worksheet = XLSX.utils.aoa_to_sheet(worksheetData);
    XLSX.utils.book_append_sheet(workbook, worksheet, 'تقرير البيوت');

    // Save the workbook to a file
    XLSX.writeFile(workbook, 'تقرير_البيوت.xlsx');
  };

  const filteredHouses = houses.filter(house =>
    house.house_number ? house.house_number.toLowerCase().includes(searchQuery.toLowerCase()) : true
  );

  return (
    <div className="persons-container" style={{ direction: 'rtl' }}>
      <h1>البيوت</h1>

      {/* Search input */}
      <input
        type="text"
        placeholder="ابحث عن البيوت"
        value={searchQuery}
        onChange={(e) => setSearchQuery(e.target.value)}
        className="search-input"
      />

      {/* Add new house form */}
      <h2>إضافة بيت جديد</h2>
      <form className="person-form">
        <input
          type="text"
          name="house_number"
          placeholder="رقم المنزل"
          value={newHouse.house_number}
          onChange={handleInputChange}
          className="form-input"
        />
        <input
          type="text"
          name="person_contacted"
          placeholder="الشخص الذي تم الاتصال به"
          value={newHouse.person_contacted}
          onChange={handleInputChange}
          className="form-input"
        />
        <input
          type="number"
          name="total_people"
          placeholder="عدد الأشخاص"
          value={newHouse.total_people}
          onChange={handleInputChange}
          className="form-input"
        />
        <input
          type="number"
          name="under_two_years"
          placeholder="أقل من سنتين"
          value={newHouse.under_two_years}
          onChange={handleInputChange}
          className="form-input"
        />
        <input
          type="number"
          name="under_thirteen_years"
          placeholder="أقل من 13 سنة"
          value={newHouse.under_thirteen_years}
          onChange={handleInputChange}
          className="form-input"
        />
        <input
          type="number"
          name="over_thirteen_years"
          placeholder="أكبر من 13 سنة"
          value={newHouse.over_thirteen_years}
          onChange={handleInputChange}
          className="form-input"
        />
        <input
          type="text"
          name="current_residence"
          placeholder="مكان الإقامة الحالي"
          value={newHouse.current_residence}
          onChange={handleInputChange}
          className="form-input"
        />
        <input
          type="text"
          name="displacement_location"
          placeholder="مكان النزوح"
          value={newHouse.displacement_location}
          onChange={handleInputChange}
          className="form-input"
        />
        <label>
          <input
            type="checkbox"
            name="furnished_home"
            checked={newHouse.furnished_home}
            onChange={handleInputChange}
          />
          منزل مفروش
        </label>
        <label>
          <input
            type="checkbox"
            name="gas"
            checked={newHouse.gas}
            onChange={handleInputChange}
          />
          غاز
        </label>
        <button type="button" onClick={handleAddHouse} className="form-button">
          إضافة
        </button>
      </form>

      {/* Generate Report Button */}
      <button onClick={generateReport} className="form-button generate-report">
        تحميل تقرير البيوت
      </button>

      {/* Houses table */}
      <h2>قائمة البيوت</h2>
      <table className="persons-table">
        <thead>
          <tr>
            <th>رقم المنزل</th>
            <th>الشخص الذي تم الاتصال به</th>
            <th>عدد الأشخاص</th>
            <th>أقل من سنتين</th>
            <th>أقل من 13 سنة</th>
            <th>أكبر من 13 سنة</th>
            <th>مكان الإقامة الحالي</th>
            <th>مكان النزوح</th>
            <th>منزل مفروش</th>
            <th>غاز</th>
            <th>إجراءات</th>
          </tr>
        </thead>
        <tbody>
          {filteredHouses.map(house => (
            <tr key={house.id}>
              <td>{house.house_number || 'N/A'}</td>
              <td>{house.person_contacted || 'N/A'}</td>
              <td>{house.total_people || '0'}</td>
              <td>{house.under_two_years || '0'}</td>
              <td>{house.under_thirteen_years || '0'}</td>
              <td>{house.over_thirteen_years || '0'}</td>
              <td>{house.current_residence || 'N/A'}</td>
              <td>{house.displacement_location || 'N/A'}</td>
              <td>{house.furnished_home ? 'نعم' : 'لا'}</td>
              <td>{house.gas ? 'نعم' : 'لا'}</td>
              <td>
                <button onClick={() => handleEditHouse(house)}>تعديل</button>
                <button onClick={() => handleDeleteHouse(house.id)}>حذف</button>
                {isEditing === house.id && (
                  <button onClick={() => handleSaveHouse(house.id)}>حفظ</button>
                )}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Houses;
