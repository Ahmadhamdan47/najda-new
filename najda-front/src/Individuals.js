import React, { useState, useEffect } from 'react';
import axios from 'axios';
import * as XLSX from 'xlsx'; // Import the xlsx library
import './Persons.css'; // Reuse the same CSS for styling

const Individuals = () => {
  const [individuals, setIndividuals] = useState([]);
  const [houses, setHouses] = useState([]);
  const [families, setFamilies] = useState([]);
  const [searchQuery, setSearchQuery] = useState('');
  const [isEditing, setIsEditing] = useState(null);
  const [newIndividual, setNewIndividual] = useState({
    name: '',
    type: 'house_contact',
    house_id: '',
    family_id: '',
  });

  useEffect(() => {
    fetchIndividuals();
    fetchHouses();
    fetchFamilies();
  }, []);

  const fetchIndividuals = () => {
    axios.get('http://localhost:5000/individuals')
      .then(response => setIndividuals(response.data))
      .catch(error => console.error('Error fetching individuals:', error));
  };

  const fetchHouses = () => {
    axios.get('http://localhost:5000/houses')
      .then(response => setHouses(response.data))
      .catch(error => console.error('Error fetching houses:', error));
  };

  const fetchFamilies = () => {
    axios.get('http://localhost:5000/families')
      .then(response => setFamilies(response.data))
      .catch(error => console.error('Error fetching families:', error));
  };

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setNewIndividual(prevState => ({ ...prevState, [name]: value }));
  };

  const handleAddIndividual = () => {
    const formattedIndividual = {
      ...newIndividual,
      house_id: newIndividual.house_id || null,
      family_id: newIndividual.family_id || null,
    };

    axios.post('http://localhost:5000/individuals', formattedIndividual)
      .then(() => {
        fetchIndividuals();
        setNewIndividual({ name: '', type: 'house_contact', house_id: '', family_id: '' });
      })
      .catch(error => console.error('Error adding individual:', error));
  };

  const handleEditIndividual = (individual) => {
    setIsEditing(individual.id);
    setNewIndividual(individual);
  };

  const handleSaveIndividual = (individualId) => {
    const formattedIndividual = {
      ...newIndividual,
      house_id: newIndividual.house_id || null,
      family_id: newIndividual.family_id || null,
    };

    axios.put(`http://localhost:5000/individuals/${individualId}`, formattedIndividual)
      .then(() => {
        fetchIndividuals();
        setIsEditing(null);
      })
      .catch(error => console.error('Error saving individual:', error));
  };

  const handleDeleteIndividual = (individualId) => {
    axios.delete(`http://localhost:5000/individuals/${individualId}`)
      .then(() => fetchIndividuals())
      .catch(error => console.error('Error deleting individual:', error));
  };

  const generateReport = () => {
    // Define Arabic column headers for the Excel report
    const worksheetData = [
      ['اسم الفرد', 'النوع', 'المنزل', 'العائلة'],
      ...individuals.map(individual => [
        individual.name || 'N/A',
        individual.type === 'house_contact' ? 'جهة الاتصال بالمنزل' : 'رب الأسرة',
        houses.find(h => h.id === individual.house_id)?.house_label || 'N/A',
        families.find(f => f.id === individual.family_id)?.family_head || 'N/A',
      ]),
    ];

    // Create a new workbook and add the worksheet
    const workbook = XLSX.utils.book_new();
    const worksheet = XLSX.utils.aoa_to_sheet(worksheetData);
    XLSX.utils.book_append_sheet(workbook, worksheet, 'تقرير الأفراد');

    // Save the workbook to a file
    XLSX.writeFile(workbook, 'تقرير_الأفراد.xlsx');
  };

  const filteredIndividuals = individuals.filter(individual =>
    individual.name.toLowerCase().includes(searchQuery.toLowerCase())
  );

  return (
    <div className="persons-container">
      <h1>الأفراد</h1>

      {/* Search input */}
      <input
        type="text"
        placeholder="ابحث عن الأفراد"
        value={searchQuery}
        onChange={(e) => setSearchQuery(e.target.value)}
        className="search-input"
      />

      {/* Add new individual form */}
      <h2>إضافة فرد جديد</h2>
      <form className="person-form">
        <input
          type="text"
          name="name"
          placeholder="اسم الفرد"
          value={newIndividual.name}
          onChange={handleInputChange}
          className="form-input"
        />
        <select
          name="type"
          value={newIndividual.type}
          onChange={handleInputChange}
          className="form-input"
        >
          <option value="house_contact">جهة الاتصال بالمنزل</option>
          <option value="family_head">رب الأسرة</option>
        </select>

        {/* Dropdown for selecting house */}
        <select
          name="house_id"
          value={newIndividual.house_id}
          onChange={handleInputChange}
          className="form-input"
        >
          <option value="">اختر المنزل</option>
          {houses.map(house => (
            <option key={house.id} value={house.id}>{house.house_label}</option>
          ))}
        </select>

        {/* Dropdown for selecting family */}
        <select
          name="family_id"
          value={newIndividual.family_id}
          onChange={handleInputChange}
          className="form-input"
        >
          <option value="">اختر العائلة</option>
          {families.map(family => (
            <option key={family.id} value={family.id}>{family.family_head}</option>
          ))}
        </select>

        <button type="button" onClick={handleAddIndividual} className="form-button">
          إضافة
        </button>
      </form>

      {/* Generate Report Button */}
      <button onClick={generateReport} className="form-button generate-report">
        تحميل تقرير الأفراد
      </button>

      {/* Individuals table */}
      <h2>قائمة الأفراد</h2>
      <table className="persons-table">
        <thead>
          <tr>
            <th>اسم الفرد</th>
            <th>النوع</th>
            <th>المنزل</th>
            <th>العائلة</th>
            <th>إجراءات</th>
          </tr>
        </thead>
        <tbody>
          {filteredIndividuals.map(individual => (
            <tr key={individual.id}>
              <td>{individual.name}</td>
              <td>{individual.type === 'house_contact' ? 'جهة الاتصال بالمنزل' : 'رب الأسرة'}</td>
              <td>{houses.find(h => h.id === individual.house_id)?.house_label || 'N/A'}</td>
              <td>{families.find(f => f.id === individual.family_id)?.family_head || 'N/A'}</td>
              <td>
                <button onClick={() => handleEditIndividual(individual)}>تعديل</button>
                <button onClick={() => handleDeleteIndividual(individual.id)}>حذف</button>
                {isEditing === individual.id && (
                  <button onClick={() => handleSaveIndividual(individual.id)}>حفظ</button>
                )}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Individuals;
