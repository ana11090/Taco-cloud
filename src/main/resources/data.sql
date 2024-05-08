CREATE TABLE Ingredient (
                            id VARCHAR(4),
                            name VARCHAR(25),
                            type VARCHAR(10)
);

INSERT INTO Ingredient (id, name, type) VALUES
                                            ('FLTO', 'Flour Tortilla', 'WRAP'),
                                            ('COTO', 'Corn Tortilla', 'WRAP'),
                                            ('GRBF', 'Ground Beef', 'PROTEIN'),
                                            ('CARN', 'Carnitas', 'PROTEIN'),
                                            ('TMTO', 'Diced Tomatoes', 'VEGGIES'),
                                            ('LETC', 'Lettuce', 'VEGGIES'),
                                            ('CHED', 'Cheddar', 'CHEESE'),
                                            ('JACK', 'Monterrey Jack', 'CHEESE'),
                                            ('SLSA', 'Salsa', 'SAUCE'),
                                            ('SRCR', 'Sour Cream', 'SAUCE');
