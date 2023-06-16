CREATE OR REPLACE FUNCTION converterMesure(
      measure1 CONVERTER.MEASURE_BASE%TYPE,
      measure2 CONVERTER.MEASURE_BASE%TYPE,
      value NUMBER)
RETURN NUMBER IS
  res NUMBER := NULL;
  rConverter_ CONVERTER%ROWTYPE;
  rConverter2_ CONVERTER%ROWTYPE;
  encontrado BOOLEAN := FALSE;

BEGIN

  <<directa>>
  BEGIN
    SELECT *
    INTO rConverter_
    FROM CONVERTER
    WHERE
      (
        (measure_base = measure1 and measure_destination = measure2)
        or
        (measure_base = measure2 and measure_destination = measure1)
      );
    encontrado := TRUE;
    IF rConverter_.measure_base = measure1 THEN
      res := value * rConverter_.ratio_to_1;
    ELSE
      res := value / rConverter_.ratio_to_1;
    END IF;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      encontrado := FALSE;
  END directa;

  IF NOT encontrado THEN

    <<diferida>>
    BEGIN
      SELECT *
      INTO rConverter_
      FROM CONVERTER
      WHERE measure_destination = measure1;

      SELECT *
      INTO rConverter2_
      FROM CONVERTER
      WHERE measure_destination = measure2
        AND measure_base = rConverter_.measure_base;

      encontrado := TRUE;
      res := value / rConverter_.ratio_to_1;
      res := res * rConverter2_.ratio_to_1;

    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        encontrado := FALSE;
    END diferida;

  END IF;

  RETURN res;
END;
/
