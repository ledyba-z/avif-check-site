#! /bin/bash

cat <<EOF
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>All images</title>
    <style>
      table, th, td {
        border-collapse: collapse;
        border: 1px solid #ccc;
        line-height: 1.5;
      }
      td {
        padding: 0.5em;
      }
    </style>
  </head>
  <body>
EOF

echo "<h1>AVIF images</h1>"

for avif in encoded/*; do
avif=${avif/encoded\/}
cat <<EOF
  <h2><a href="#${avif}" name="${avif}">${avif}</a><h2>
   <table>
    <tr>
      <th>Expected result</th>
      <th>AVIF version</th>
    </tr>
    <tr>
      <td><img src="./decoded/${avif/.avif/.png}" width="400"></td>
      <td><img src="./encoded/${avif}" width="400"></td>
    </tr>
  </table>
EOF

done

echo "<h1>AVIF with ICC images</h1>"

for avif in \
  red-at-12-oclock-with-color-profile-lossy.avif \
  red-at-12-oclock-with-color-profile-8bpc.avif \
  red-at-12-oclock-with-color-profile-10bpc.avif \
  red-at-12-oclock-with-color-profile-12bpc.avif
do
cat <<EOF
  <h2><a href="#${avif}" name="${avif}">${avif}</a><h2>
   <table>
    <tr>
      <th>Expected result</th>
      <th>AVIF version</th>
    </tr>
    <tr>
      <td><img src="./red-at-12-oclock-with-color-profile.png" width="400"></td>
      <td><img src="./${avif}" width="400"></td>
    </tr>
  </table>
EOF
done

echo "<h1>AVIFS images</h1>"

cat <<EOF
  <h2><a href="#star.avifs" name="star.avifs">star.avifs</a><h2>
   <table>
    <tr>
      <th>GIF version</th>
      <th>AVIF version</th>
    </tr>
    <tr>
      <td><img src="./star.gif" width="400"></td>
      <td><img src="./star.avifs" width="400"></td>
    </tr>
  </table>

  <h2><a href="#star-with-alpha.avifs" name="star-with-alpha.avifs">star-with-alpha.avifs</a><h2>
   <table>
    <tr>
      <th>GIF version</th>
      <th>AVIF version</th>
    </tr>
    <tr>
      <td><img src="./star.gif" width="400"></td>
      <td><img src="./star-with-alpha.avifs" width="400"></td>
    </tr>
  </table>

EOF

cat <<EOF
  </body>
</html>
EOF