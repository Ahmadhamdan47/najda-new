import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './Persons.css'; // Reuse the same CSS for styling

const Individuals = () => {
  const [individuals, setIndividuals] = useState([]);
  const [searchQuery, setSearchQuery] = useState('');
  const [isEditing, setIsEditing] = useState(null);
  const [newIndividual, setNewIndividual] = useState({
    name: '',
    type: 'house_contact', // or 'family_head'
  });

  useEffect(() => {
    fetchIndividuals();
  }, []);

  const fetchIndividuals = () => {
    axios.get('http://localhost:5000/individuals')
      .then(response => setIndividuals(response.data))
      .catch(error => console.error(error));
  };

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setNewIndividual(prevState => ({ ...prevState, [name]: value }));
  };

  const handleAddIndividual = () => {
    axios.post('http://localhost:5000/individuals', newIndividual)
      .then(() => {
        fetchIndividuals();
        setNewIndividual({ name: '', type: 'house_contact' });
      })
      .catch(error => console.error('Error adding individual:', error));
  };

  const handleEditIndividual = (individual) => {
    setIsEditing(individual.id);
    setNewIndividual(individual);
  };

  const handleSaveIndividual = (individualId) => {
    axios.put(`http://localhost:5000/individuals/${individualId}`, newIndividual)
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
        <button type="button" onClick={handleAddIndividual} className="form-button">
          إضافة
        </button>
      </form>

      {/* Individuals table */}
      <h2>قائمة الأفراد</h2>
      <table className="persons-table">
        <thead>
          <tr>
            <th>اسم الفرد</th>
            <th>النوع</th>
            <th>إجراءات</th>
          </tr>
        </thead>
        <tbody>
          {filteredIndividuals.map(individual => (
            <tr key={individual.id}>
              <td>{individual.name}</td>
              <td>{individual.type === 'house_contact' ? 'جهة الاتصال بالمنزل' : 'رب الأسرة'}</td>
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
