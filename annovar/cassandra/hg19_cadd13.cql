USE sequence_databases;

CREATE TABLE hg19_cadd13
(
    chromosome VARCHAR,
    start INT,
    end INT,
    ref VARCHAR,
    alt VARCHAR,
    cadd13_rawscore DECIMAL,
    cadd13_phred DECIMAL,
    PRIMARY KEY ((chromosome, ref, alt), start, end, cadd13_rawscore, cadd13_phred)
);