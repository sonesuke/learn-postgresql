for file in ./*.sql; do
  echo "processing ${file}"
  sed -i "/-- EOF/,$ d" ${file}
  echo "-- EOF" >> ${file}
  psql -U postgres < ${file} | sed "s/^/-- /" >> ${file}
done