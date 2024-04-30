SELECT 
    piece_length as length, 
    num_work_ids_different_authors as metric,
    piece_text(ts.text,trs_start,trs_end) as text 
FROM 
    source_piece_statistics_denorm spsd 
    INNER JOIN textreuse_ids ti USING(trs_id)
    INNER JOIN textreuse_sources ts USING(trs_id)
WHERE 
    |\tikzmark{doc-start}|manifestation_id = "A48874"|\tikzmark{doc-end}|
    AND piece_length BETWEEN 150 AND 200
    AND num_work_ids_different_authors >=20
ORDER BY 
    num_work_ids_different_authors DESC,
    trs_start 
LIMIT 12