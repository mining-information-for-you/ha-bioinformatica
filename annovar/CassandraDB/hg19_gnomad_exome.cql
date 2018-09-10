USE annovar;

CREATE TABLE hg19_gnomad_exome
(
    chr VARCHAR,
    start BIGINT,
    end BIGINT,
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
    PRIMARY KEY (ref, alt, gnomad_exome_all, gnomad_exome_afr, gnomad_exome_amr, gnomad_exome_asj, gnomad_exome_eas,
    gnomad_exome_fin, gnomad_exome_nfe, gnomad_exome_oth, gnomad_exome_sas)
)