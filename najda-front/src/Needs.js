import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './Persons.css'; // Reuse the same CSS for consistency

const Needs = () => {
  const [needs, setNeeds] = useState([]);
  const [searchQuery, setSearchQuery] = useState('');
  const [isEditing, setIsEditing] = useState(null);
  const [newNeed, setNewNeed] = useState({
    food_aid: false,
    medicine: false,
    furniture: false,
    clothes: false,
    cleaning_supplies: false,
    house_id: '', // or family_head
    family_head: ''
  });

  useEffect(() => {
    fetchNeeds();
  }, []);

  const fetchNeeds = () => {
    axios.get('http://localhost:5000/needs')
      .then(response => {
        console.log('Fetched needs:', response.data);
        setNeeds(response.data);
      })
      .catch(error => console.error(error));
  };

  const handleInputChange = (e) => {
    const { name, value, type, checked } = e.target;
    const inputValue = type === 'checkbox' ? checked : value;
    setNewNeed(prevState => ({ ...prevState, [name]: inputValue }));
  };

  const handleAddNeed = () => {
    axios.post('http://localhost:5000/needs', newNeed)
      .then(() => {
        fetchNeeds();
        setNewNeed({
          food_aid: false,
          medicine: false,
          furniture: false,
          clothes: false,
          cleaning_supplies: false,
          house_id: '', // Reset to empty after add
          family_head: ''
        });
      })
      .catch(error => console.error('Error adding need:', error));
  };

  const handleEditNeed = (need) => {
    setIsEditing(need.id);
    setNewNeed(need);
  };

  const handleSaveNeed = (needId) => {
    axios.put(`http://localhost:5000/needs/${needId}`, newNeed)
      .then(() => {
        fetchNeeds();
        setIsEditing(null);
      })
      .catch(error => console.error('Error saving need:', error));
  };

  const handleDeleteNeed = (needId) => {
    axios.delete(`http://localhost:5000/needs/${needId}`)
      .then(() => fetchNeeds())
      .catch(error => console.error('Error deleting need:', error));
  };

  const filteredNeeds = needs.filter(need =>
    need.house_id || need.family_head
      ? (need.house_id && need.house_id.toString().includes(searchQuery)) ||
        (need.family_head && need.family_head.toLowerCase().includes(searchQuery.toLowerCase()))
      : true
  );

  return (
    <div className="persons-container" style={{ direction: 'rtl' }}>
      <h1>الاحتياجات</h1>

      {/* Search input */}
      <input
        type="text"
        placeholder="ابحث عن الاحتياجات"
        value={searchQuery}
        onChange={(e) => setSearchQuery(e.target.value)}
        className="search-input"
      />

      {/* Add new need form */}
      <h2>إضافة احتياج جديد</h2>
      <form className="person-form">
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
        <input
          type="text"
          name="house_id"
          placeholder="معرف المنزل"
          value={newNeed.house_id}
          onChange={handleInputChange}
          className="form-input"
        />
        <input
          type="text"
          name="family_head"
          placeholder="رب الأسرة"
          value={newNeed.family_head}
          onChange={handleInputChange}
          className="form-input"
        />
        <button type="button" onClick={handleAddNeed} className="form-button">
          إضافة
        </button>
      </form>

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
            <th>معرف المنزل/رب الأسرة</th>
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
              <td>{need.house_id ? need.house_id : need.family_head || 'N/A'}</td>
              <td>
                <button onClick={() => handleEditNeed(need)}>تعديل</button>
                <button onClick={() => handleDeleteNeed(need.id)}>حذف</button>
                {isEditing === need.id && (
                  <button onClick={() => handleSaveNeed(need.id)}>حفظ</button>
                )}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Needs;
