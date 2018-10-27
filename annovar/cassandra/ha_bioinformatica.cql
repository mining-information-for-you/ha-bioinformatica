CREATE KEYSPACE IF NOT EXISTS ha_bioinformatica WITH REPLICATION = {'class' : 'SimpleStrategy', 'replication_factor' : 1};

USE ha_bioinformatica;

CREATE TABLE IF NOT EXISTS hg19_abraom
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

CREATE TABLE IF NOT EXISTS hg19_avsnp150
(
    chromosome VARCHAR,
    start INT,
    end INT,
    ref VARCHAR,
    alt VARCHAR,
    human_varianty VARCHAR,
    PRIMARY KEY ((chromosome, ref, alt), start, end, human_varianty)
);

CREATE TABLE IF NOT EXISTS hg19_cadd13
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

CREATE TABLE IF NOT EXISTS hg19_clinvar
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

CREATE TABLE IF NOT EXISTS hg19_gerp_elem
(
    chromosome VARCHAR,
    start INT,
    end INT,
    rs_score DECIMAL,
    p_value DECIMAL,
    PRIMARY KEY (chromosome, start, end, rs_score, p_value)
);

CREATE TABLE IF NOT EXISTS hg19_gnomad_exome
(
    chromosome VARCHAR,
    start INT,
    end INT,
    ref VARCHAR,
    alt VARCHAR,
    gnomad_exome_all VARCHAR,
    gnomad_exome_afr VARCHAR,
    gnomad_exome_amr VARCHAR,
    gnomad_exome_asj VARCHAR,
    gnomad_exome_eas VARCHAR,
    gnomad_exome_fin VARCHAR,
    gnomad_exome_nfe VARCHAR,
    gnomad_exome_oth VARCHAR,
    gnomad_exome_sas VARCHAR,
    PRIMARY KEY ((chromosome, ref, alt), start, end, gnomad_exome_all, gnomad_exome_afr, gnomad_exome_amr, gnomad_exome_asj, gnomad_exome_eas,
    gnomad_exome_fin, gnomad_exome_nfe, gnomad_exome_oth, gnomad_exome_sas)
);

CREATE TABLE IF NOT EXISTS hg19_mcap
(
  chromosome VARCHAR,
  start INT,
  end INT,
  ref VARCHAR,
  alt VARCHAR,
  mcap DECIMAL,
  PRIMARY KEY((chromosome, ref, alt), start, end, mcap)
);

CREATE TABLE IF NOT EXISTS hg19_revel
(
    chromosome VARCHAR,
    start INT,
    end INT,
    ref VARCHAR,
    alt VARCHAR,
    revel DECIMAL,
    PRIMARY KEY ((chromosome, ref, alt), start, end, revel)
);