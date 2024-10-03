const mysql = require('mysql');
const xlsx = require('xlsx');

// Load the Excel file
const workbook = xlsx.readFile('data.xlsx');

// Connect to MySQL
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'najda_new'
});

connection.connect(err => {
  if (err) throw err;
  console.log('Connected to MySQL');
});

// Get data from each sheet
const housesSheet = xlsx.utils.sheet_to_json(workbook.Sheets['Sheet1']);
const familiesSheet = xlsx.utils.sheet_to_json(workbook.Sheets['Sheet2']);
const needsSheet = xlsx.utils.sheet_to_json(workbook.Sheets['Sheet3']);

// Insert data into Houses table
housesSheet.forEach(row => {
  const sql = `INSERT INTO houses (house_label, total_people, under_two_years, under_thirteen_years, over_thirteen_years, current_residence, displacement_location, furnished_home, gas)
               VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`;
  const values = [
    row['الاسم'],  // Adjust column names as needed
    row['عدد الاشخاص'],
    row['الفئة العمرية (تحت السنتين)'],
    row['تحت 13 سنة'],
    row['فوق ال13 سنة'],
    row['مكان الاقامة الحالية'],
    row['مكان النزوح'],
    row['منزل مفروش'] === 'نعم',  // Convert to boolean
    row['غاز'] === 'بحاجة'        // Convert to boolean
  ];

  connection.query(sql, values, (err, result) => {
    if (err) throw err;
    console.log('House data inserted');
  });
});

// Insert data into Families table
familiesSheet.forEach(row => {
  const sql = `INSERT INTO families (family_head, total_members, under_two_years, under_thirteen_years, over_thirteen_years, marital_status, health_conditions, notes, phone_number, house_id, furniture_needed, clothes_needed, household_tools_needed)
               VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;
  const values = [
    row['رب العائلة'],  // Adjust column names as needed
    row['عدد الافراد'],
    row['الفئة العمرية (تحت السنتين)'],
    row['تحت ال13 سنة'],
    row['فوق ال13'],
    row['الحالة الاجتماعية'],
    row['الحالات المرضية'],
    row['ملاحظات'],
    row['رقم الهاتف'],
    row['رقم البيت'],  // Assuming this is the house ID
    row['فرش'] === 'نعم',  // Convert to boolean
    row['ملابس'] === 'نعم',  // Convert to boolean
    row['ادوات منزلية'] === 'نعم'  // Convert to boolean
  ];

  connection.query(sql, values, (err, result) => {
    if (err) throw err;
    console.log('Family data inserted');
  });
});

// Insert data into Needs table
needsSheet.forEach(row => {
  const sql = `INSERT INTO needs (food_aid, medicine, furniture, clothes, cleaning_supplies)
               VALUES (?, ?, ?, ?, ?)`;
  const values = [
    row['حصة غذائية'] === 'نعم',  // Convert to boolean
    row['ادوية'] === 'نعم',  // Convert to boolean
    row['فرش'] === 'نعم',  // Convert to boolean
    row['ملابس'] === 'نعم',  // Convert to boolean
    row['مواد تنظيف'] === 'نعم'  // Convert to boolean
  ];

  connection.query(sql, values, (err, result) => {
    if (err) throw err;
    console.log('Needs data inserted');
  });
});

// Close the MySQL connection
connection.end(err => {
  if (err) throw err;
  console.log('Connection to MySQL closed');
});
