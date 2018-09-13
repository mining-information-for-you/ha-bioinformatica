USE annovar;

CREATE TABLE hg19_clinvar
(
  chr VARCHAR,
  start INT,
  end INT,
  ref VARCHAR,
  alt VARCHAR,
  clinsig VARCHAR,
  clndbn VARCHAR,
  clnacc VARCHAR,
  clndsdb VARCHAR,
  clndsdbid VARCHAR,
  PRIMARY KEY(clnacc, clndsdb, clndsdbid)
)