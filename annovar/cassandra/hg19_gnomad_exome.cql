USE sequence_databases;

CREATE TABLE hg19_gnomad_exome
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