SET SERVEROUTPUT ON;

DECLARE
    -- 1. Define a record for earthquake readings
    TYPE earthquake_rec IS RECORD (
        sensor_id   NUMBER,
        location    VARCHAR2(50),
        magnitude   NUMBER,
        depth_km    NUMBER,
        classification VARCHAR2(20)
    );

    -- 2. Define a collection to hold multiple readings
    TYPE earthquake_table IS TABLE OF earthquake_rec;
    earthquakes earthquake_table := earthquake_table();

BEGIN
    -- 3. Insert sample data
    earthquakes.EXTEND(5);

    earthquakes(1).sensor_id := 101;
    earthquakes(1).location := 'Kigali East';
    earthquakes(1).magnitude := 3.5;
    earthquakes(1).depth_km := 10;

    earthquakes(2).sensor_id := 205;
    earthquakes(2).location := 'Goma North';
    earthquakes(2).magnitude := 7.2;
    earthquakes(2).depth_km := 12;

    earthquakes(3).sensor_id := 301;
    earthquakes(3).location := 'Nyamirambo';
    earthquakes(3).magnitude := 5.4;
    earthquakes(3).depth_km := 8;

    earthquakes(4).sensor_id := 404;
    earthquakes(4).location := 'Rubavu';
    earthquakes(4).magnitude := -1; -- Invalid data
    earthquakes(4).depth_km := 15;

    earthquakes(5).sensor_id := 505;
    earthquakes(5).location := 'Musanze';
    earthquakes(5).magnitude := 6.8;
    earthquakes(5).depth_km := 20;

    -- 4. Process each earthquake
    FOR i IN 1..earthquakes.COUNT LOOP
        IF earthquakes(i).magnitude < 0 THEN
            GOTO handle_invalid;
        ELSIF earthquakes(i).magnitude >= 7.0 THEN
            GOTO handle_severe;
        ELSE
            -- Classify magnitude
            IF earthquakes(i).magnitude < 4 THEN
                earthquakes(i).classification := 'Minor';
            ELSIF earthquakes(i).magnitude < 6 THEN
                earthquakes(i).classification := 'Light';
            ELSE
                earthquakes(i).classification := 'Strong';
            END IF;
        END IF;

        -- Display normal readings
        DBMS_OUTPUT.PUT_LINE(
            'Sensor ' || earthquakes(i).sensor_id ||
            ' | ' || earthquakes(i).location ||
            ' | Magnitude: ' || earthquakes(i).magnitude ||
            ' | ' || earthquakes(i).classification
        );

        CONTINUE;

        <<handle_severe>>
        earthquakes(i).classification := 'Severe';
        DBMS_OUTPUT.PUT_LINE(
            'Sensor ' || earthquakes(i).sensor_id ||
            ' | ' || earthquakes(i).location ||
            ' | Magnitude: ' || earthquakes(i).magnitude ||
            ' | *** SEVERE ALERT ***'
        );
        CONTINUE;

        <<handle_invalid>>
        earthquakes(i).classification := 'Invalid';
        DBMS_OUTPUT.PUT_LINE(
            'Sensor ' || earthquakes(i).sensor_id ||
            ' | ' || earthquakes(i).location ||
            ' | Magnitude: ' || earthquakes(i).magnitude ||
            ' | INVALID DATA DETECTED'
        );
    END LOOP;

END;
/
