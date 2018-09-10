USE annovar;

CREATE TABLE hg19_abraom
(
    chr VARCHAR,
    start BIGINT,
    end BIGINT,
    ref VARCHAR,
    alt VARCHAR,
    abraom_freq DECIMAL(32, 10),
    abraom_filter VARCHAR,
    abraom_cegh_filter VARCHAR,
    PRIMARY KEY(abraom_filter, abraom_cegh_filter, abraom_freq)
)