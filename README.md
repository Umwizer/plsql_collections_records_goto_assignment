# Earthquake Monitoring & Early-Warning System — PL/SQL Project

## 1. Project Overview

This project simulates an **earthquake monitoring system** using PL/SQL.  
It demonstrates the use of:

- **Records** to represent each earthquake reading
- **Collections** to store multiple readings
- **GOTO statements** for handling critical alerts and invalid data

The program processes sensor data, classifies earthquakes, and triggers warnings for severe events.

---

## 2. Concepts Demonstrated

| Concept    | Purpose                                                                               |
| ---------- | ------------------------------------------------------------------------------------- |
| Record     | Stores one earthquake reading (Sensor ID, Location, Magnitude, Depth, Classification) |
| Collection | Holds multiple earthquake readings for processing                                     |
| GOTO       | Handles critical alerts (magnitude ≥ 7.0) and invalid readings                        |
| Loops & IF | Iterates through readings and classifies events                                       |

---

## 3. Program Flow

1. Create a **record type** for earthquake readings.
2. Create a **collection** of records for multiple sensors.
3. Insert **sample sensor readings** into the collection.
4. Loop through the collection to:
   - Classify the earthquake (Minor, Light, Strong, Severe)
   - Trigger emergency alert if magnitude ≥ 7.0 using **GOTO**
   - Handle invalid data (<0) using **GOTO**
5. Display a **formatted report** using `DBMS_OUTPUT.PUT_LINE`.

---

## 4. How the System Works

### Step 1: Create Data Types

The program defines:

- A **Record type** for each earthquake reading:

  - Sensor ID
  - Location
  - Magnitude
  - Depth
  - Classification

- A **Nested Table (Collection)** type to store multiple earthquake readings.

### Step 2: Insert Sample Data

Five example sensors are added:

- Kigali East
- Goma North
- Nyamirambo
- Rubavu
- Musanze

Each has:

- Magnitude readings
- Depth values

### Step 3: Validate Readings

- Using **GOTO (`handle_invalid`)**, the code checks if any magnitude is negative.
- Using **GOTO (`handle_severe`)**, it flags magnitudes ≥ 7.0 as **SEVERE ALERT**.

### Step 4: Display Reports

Final reports show:

- Sensor ID
- Location
- Magnitude
- Classification (Minor, Light, Strong, Severe, Invalid)

---

## 5. Main SQL File

The full PL/SQL implementation is located in:
earthquake_monitoring.sql
It includes:

Record type and Collections

GOTO statements for alert and error handling

Looping and conditional logic

Formatted output via DBMS_OUTPUT.PUT_LINE

## 6. Example Output

yaml
Copy code
---- EARTHQUAKE MONITORING REPORT ----

Sensor 101 | Kigali East | Magnitude: 3.5 | Minor
Sensor 205 | Goma North | Magnitude: 7.2 | **_ SEVERE ALERT _**
Sensor 301 | Nyamirambo | Magnitude: 5.4 | Strong
Sensor 404 | Rubavu | Magnitude: -1 | INVALID DATA DETECTED
Sensor 505 | Musanze | Magnitude: 6.8 | Strong

## 7. Useful Oracle Documentation (Official)

PL/SQL Collections & Records
https://docs.oracle.com/en/database/oracle/oracle-database/21/lnpls/plsql-collections-and-records.html

VARRAY & Nested Table Types
https://docs.oracle.com/en/database/oracle/oracle-database/21/lnpls/plsql-collections-and-records.html#GUID-A9134E89

GOTO Statement
https://docs.oracle.com/en/database/oracle/oracle-database/21/lnpls/control-statements.html#GUID-BCBF92E6
