USE sequence_databases;

CREATE TABLE hg19_avsnp150
(
    chromosome VARCHAR,
    start INT,
    end INT,
    ref VARCHAR,
    alt VARCHAR,
    human_varianty VARCHAR,
    PRIMARY KEY ((chromosome, ref, alt), start, end, human_varianty)
);