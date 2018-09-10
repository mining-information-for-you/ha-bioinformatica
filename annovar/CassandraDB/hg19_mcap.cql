USE annovar;

CREATE TABLE hg19_mcap
(
  char VARCHAR,
  start BIGINT,
  end BIGINT,
  ref VARCHAR,
  alt VARCHAR,
  mcap DECIMAL(32, 20),
  PRIMARY KEY(ref, alt, mcap)
)