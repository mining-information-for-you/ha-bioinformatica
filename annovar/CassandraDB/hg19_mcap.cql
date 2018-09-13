USE annovar;

CREATE TABLE hg19_mcap
(
  char VARCHAR,
  start INT,
  end INT,
  ref VARCHAR,
  alt VARCHAR,
  mcap DECIMAL,
  PRIMARY KEY(ref, alt, mcap)
)