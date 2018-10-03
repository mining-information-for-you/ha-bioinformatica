USE sequence_databases;

CREATE TABLE hg19_clinvar
(
  chromosome VARCHAR,
  start INT,
  end INT,
  ref VARCHAR,
  alt VARCHAR,
  clinsig VARCHAR,
  clndbn VARCHAR,
  clnacc VARCHAR,
  clndsdb VARCHAR,
  clndsdbid VARCHAR,
  PRIMARY KEY((chromosome, ref, alt), start, end, clndsdb, clndsdbid)
);