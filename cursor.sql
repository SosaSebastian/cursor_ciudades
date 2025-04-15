
CREATE TABLE tienda_discos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tienda VARCHAR(100),
    ciudad_tienda VARCHAR(100),
    email_tienda VARCHAR(100)
);


INSERT INTO tienda_discos (nombre_tienda, ciudad_tienda, email_tienda) VALUES
('Discos Melódicos', 'Buenos Aires', 'contacto@discosmelodicos.com'),
('Riffs y Ritmos', 'São Paulo', 'info@riffsyritmos.com'),
('Vinilos Classics', 'Praga', 'ventas@vinilosclassics.com'),
('Melodia Disco', 'Ciudad de México', 'contacto@melodiadisco.com'),
('El Rincón del Vinilo', 'Bogotá', 'info@elrincondelvinilo.com'),
('Música y Más', 'Santiago', 'ventas@musicaymas.com'),
('DiscoManía', 'Rio de Janeiro', 'contacto@discomania.com'),
('La Tienda del Disco', 'Montevideo', 'tienda@latiendadeldisco.com'),
('Discos y Recuerdos', 'Glasgow', 'info@discosyrecuerdos.com'),
('Mundo del Vinilo', 'Dublin', 'contacto@mundoelvinilo.com'),
('Beat Records', 'Nueva York', 'info@beatrecords.com'),
('Discos y Sonidos', 'Los Ángeles', 'contacto@discosysonidos.com'),
('Vinilos & Jazz', 'Londres', 'info@vinilosyjazz.com'),
('Discos Clásicos', 'París', 'contacto@discosclasicos.com'),
('La Casa del Disco', 'Ámsterdam', 'ventas@lacasadeldisco.com'),
('Ritmos y Melodías', 'Roma', 'contacto@ritmosymelodias.com'),
('El Disco del Barrio', 'Madrid', 'info@eldiscodelbarrio.com'),
('Discos Planet', 'Chicago', 'ventas@discosplanet.com'),
('Sonido Retro', 'Berlín', 'contacto@sonidoretro.com'),
('Tienda Vinilera', 'Barcelona', 'info@tiendavinilera.com');

-- Ejemplo del Cursor 

DELIMITER //

CREATE PROCEDURE lista_ciudades(
	INOUT city_list VARCHAR(400)
)
BEGIN 
	DECLARE finished INTEGER DEFAULT 0;
    DECLARE city_map VARCHAR(100) DEFAULT "";
    
    DECLARE curCity
		CURSOR FOR 
			SELECT ciudad_tienda FROM tienda_discos;
	
    DECLARE CONTINUE HANDLER
		FOR NOT FOUND SET finished = 1;
        
	OPEN curCity;
    getCity: LOOP
		FETCH curCity INTO city_map;
        IF finished = 1 THEN 
			LEAVE getCity;
		END IF;

        SET city_list = CONCAT(city_map,";",city_list);
	END LOOP getCity;
    CLOSE curCity;
END//

DELIMITER ;

SET @ciudades = "";
CALL lista_ciudades(@ciudades);
SELECT @ciudades AS "Lista de ciudades";

