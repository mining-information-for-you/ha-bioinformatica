USE sequence_databases;

CREATE TABLE hg19_mcap
(
  chromosome VARCHAR,
  start INT,
  end INT,
  ref VARCHAR,
  alt VARCHAR,
  mcap DECIMAL,
  PRIMARY KEY((chromosome, ref, alt), start, end, mcap)
);