

CREATE TABLE IF NOT EXISTS users_by_city (
                                             city      text,
                                             firstname text,
                                             lastname  text,
                                             email     text,
                                             PRIMARY KEY ((city), lastname, email)
) WITH CLUSTERING ORDER BY(lastname ASC, email ASC);


-- https://github.com/rmichael/workshop-introduction-to-nosql/blob/b4c9146fd35abe4a2f26c64cb6903ba11474550e/README.md