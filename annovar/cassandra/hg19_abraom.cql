USE sequence_databases;

CREATE TABLE hg19_abraom
(
    chromosome VARCHAR,
    start INT,
    end INT,
    ref VARCHAR,
    alt VARCHAR,
    abraom_freq DECIMAL,
    abraom_filter VARCHAR,
    abraom_cegh_filter VARCHAR,
    PRIMARY KEY((chromosome, ref, alt), start, end, abraom_freq)
);