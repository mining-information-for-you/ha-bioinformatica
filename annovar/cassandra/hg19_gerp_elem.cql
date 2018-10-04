USE sequence_databases;

CREATE TABLE hg19_gerp_elem
(
    chromosome VARCHAR,
    start INT,
    end INT,
    rs_score DECIMAL,
    p_value DECIMAL,
    PRIMARY KEY (chromosome, start, end, rs_score, p_value)
);