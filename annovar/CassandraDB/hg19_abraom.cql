USE annovar;

CREATE TABLE hg19_abraom
(
    chr VARCHAR,
    start INT,
    end INT,
    ref VARCHAR,
    alt VARCHAR,
    abraom_freq DECIMAL,
    abraom_filter VARCHAR,
    abraom_cegh_filter VARCHAR,
    PRIMARY KEY(abraom_filter, abraom_cegh_filter, abraom_freq)
)