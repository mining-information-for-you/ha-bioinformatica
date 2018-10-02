USE sequence_databases;

CREATE TABLE hg19_revel
(
    chromosome VARCHAR,
    start INT,
    end INT,
    ref VARCHAR,
    alt VARCHAR,
    revel DECIMAL,
    PRIMARY KEY ((chromosome, ref, alt), start, end, revel)
);