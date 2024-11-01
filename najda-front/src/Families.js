import React, { useState, useEffect } from 'react';
import axios from 'axios';
import * as XLSX from 'xlsx'; // Import the xlsx library
import './Persons.css'; // Reuse the same CSS for consistency

const Families = () => {
  const [families, setFamilies] = useState([]);
  const [searchQuery, setSearchQuery] = useState('');
  const [isEditing, setIsEditing] = useState(null);
  const [newFamily, setNewFamily] = useState({
    family_head: '',
    total_members: '',
    under_two_years: '',
    under_thirteen_years: '',
    over_thirteen_years: '',
    marital_status: '',
    phone_number: '',
    notes: '',
  });

  useEffect(() => {
    fetchFamilies();
  }, []);

  const fetchFamilies = () => {
    axios.get('http://localhost:5000/families')
      .then(response => setFamilies(response.data))
      .catch(error => console.error(error));
  };

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setNewFamily(prevState => ({ ...prevState, [name]: value }));
  };

  const handleAddFamily = () => {
    axios.post('http://localhost:5000/families', newFamily)
      .then(() => {
        fetchFamilies();
        setNewFamily({
          family_head: '',
          total_members: '',
          under_two_years: '',
          under_thirteen_years: '',
          over_thirteen_years: '',
          marital_status: '',
          phone_number: '',
          notes: ''
        });
      })
      .catch(error => console.error('Error adding family:', error));
  };

  const handleEditFamily = (family) => {
    setIsEditing(family.id);
    setNewFamily(family);
  };

  const handleSaveFamily = (familyId) => {
    axios.put(`http://localhost:5000/families/${familyId}`, newFamily)
      .then(() => {
        fetchFamilies();
        setIsEditing(null);
      })
      .catch(error => console.error('Error saving family:', error));
  };

  const handleDeleteFamily = (familyId) => {
    axios.delete(`http://localhost:5000/families/${familyId}`)
      .then(() => fetchFamilies())
      .catch(error => console.error('Error deleting family:', error));
  };

  const generateReport = () => {
    // Define Arabic column headers for the Excel report
    const worksheetData = [
      ['اسم رب العائلة', 'عدد الأفراد', 'أقل من سنتين', 'أقل من 13 سنة', 'أكبر من 13 سنة', 'الحالة الاجتماعية', 'رقم الهاتف', 'ملاحظات'],
      ...families.map(family => [
        family.family_head || 'N/A',
        family.total_members || '0',
        family.under_two_years || '0',
        family.under_thirteen_years || '0',
        family.over_thirteen_years || '0',
        family.marital_status || 'N/A',
        family.phone_number || 'N/A',
        family.notes || 'N/A',
      ]),
    ];

    // Create a new workbook and add the worksheet
    const workbook = XLSX.utils.book_new();
    const worksheet = XLSX.utils.aoa_to_sheet(worksheetData);
    XLSX.utils.book_append_sheet(workbook, worksheet, 'تقرير العائلات');

    // Save the workbook to a file
    XLSX.writeFile(workbook, 'تقرير_العائلات.xlsx');
  };

  const filteredFamilies = families.filter(family =>
    family.family_head.toLowerCase().includes(searchQuery.toLowerCase())
  );

  return (
    <div className="persons-container">
      <h1>العائلات</h1>

      {/* Search input */}
      <input
        type="text"
        placeholder="ابحث عن العائلات"
        value={searchQuery}
        onChange={(e) => setSearchQuery(e.target.value)}
        className="search-input"
      />

      {/* Add new family form */}
      <h2>إضافة عائلة جديدة</h2>
      <form className="person-form">
        <input
          type="text"
          name="family_head"
          placeholder="اسم رب العائلة"
          value={newFamily.family_head}
          onChange={handleInputChange}
          className="form-input"
        />
        <input
          type="number"
          name="total_members"
          placeholder="عدد الأفراد"
          value={newFamily.total_members}
          onChange={handleInputChange}
          className="form-input"
        />
        <input
          type="number"
          name="under_two_years"
          placeholder="أقل من سنتين"
          value={newFamily.under_two_years}
          onChange={handleInputChange}
          className="form-input"
        />
        <input
          type="number"
          name="under_thirteen_years"
          placeholder="أقل من 13 سنة"
          value={newFamily.under_thirteen_years}
          onChange={handleInputChange}
          className="form-input"
        />
        <input
          type="number"
          name="over_thirteen_years"
          placeholder="أكبر من 13 سنة"
          value={newFamily.over_thirteen_years}
          onChange={handleInputChange}
          className="form-input"
        />
        <input
          type="text"
          name="marital_status"
          placeholder="الحالة الاجتماعية"
          value={newFamily.marital_status}
          onChange={handleInputChange}
          className="form-input"
        />
        <input
          type="text"
          name="phone_number"
          placeholder="رقم الهاتف"
          value={newFamily.phone_number}
          onChange={handleInputChange}
          className="form-input"
        />
        <textarea
          name="notes"
          placeholder="ملاحظات"
          value={newFamily.notes}
          onChange={handleInputChange}
          className="form-textarea"
        />
        <button type="button" onClick={handleAddFamily} className="form-button">
          إضافة
        </button>
      </form>

      {/* Generate Report Button */}
      <button onClick={generateReport} className="form-button generate-report">
        تحميل تقرير العائلات
      </button>

      {/* Families table */}
      <h2>قائمة العائلات</h2>
      <table className="persons-table">
        <thead>
          <tr>
            <th>اسم رب العائلة</th>
            <th>عدد الأفراد</th>
            <th>رقم الهاتف</th>
            <th>إجراءات</th>
          </tr>
        </thead>
        <tbody>
          {filteredFamilies.map(family => (
            <tr key={family.id}>
              <td>{family.family_head}</td>
              <td>{family.total_members}</td>
              <td>{family.phone_number}</td>
              <td>
                <button onClick={() => handleEditFamily(family)}>تعديل</button>
                <button onClick={() => handleDeleteFamily(family.id)}>حذف</button>
                {isEditing === family.id && (
                  <button onClick={() => handleSaveFamily(family.id)}>حفظ</button>
                )}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Families;
  