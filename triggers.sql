-- 1. Validar alumnos
CREATE OR REPLACE TRIGGER trg_limite_alumnos
BEFORE INSERT ON INTERESADO
FOR EACH ROW
DECLARE
    v_total NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_total
    FROM INTERESADO
    WHERE idseccion = :NEW.idseccion;

    IF v_total >= 15 THEN
        RAISE_APPLICATION_ERROR(-20001, 
            'Error: La sección ya tiene 15 alumnos (máximo permitido)');
    END IF;
END;
/

-- Validar correo
CREATE OR REPLACE TRIGGER trg_correo_unico_docente
BEFORE INSERT OR UPDATE ON DOCENTE
FOR EACH ROW
DECLARE
    v_existe NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_existe
    FROM DOCENTE
    WHERE correo = :NEW.correo
    AND iddocente != NVL(:OLD.iddocente, -1);

    IF v_existe > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 
            'Error: El correo ya está registrado para otro docente');
    END IF;
END;
/