USE annovar;

CREATE TABLE hg19_clinvar
(
  chr VARCHAR,
  start BIGINT,
  end BIGINT,
  ref VARCHAR,
  alt VARCHAR,
  clinsig VARCHAR,
  clndbn VARCHAR,
  clnacc VARCHAR,
  clndsdb VARCHAR,
  clndsdbid VARCHAR,
  PRIMARY KEY(clnacc, clndsdb, clndsdbid)
)