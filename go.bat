set SRC_DIR=c:\code\blog
set DEST_DIR=c:\code\brianwoelfel.github.io

pushd %SRC_DIR%
git add .
git commit -m "new version"
git push

hugo

cd %DEST_DIR%
echo delete all contents except hidden folders
del /q *.*
rmdir /s /q ananke
rmdir /s /q categories
rmdir /s /q images
rmdir /s /q tags
rmdir /s /q posts
rmdir /s /q archetypes

echo copy up content
xcopy /e %SRC_DIR% %DEST_DIR%

git add .
git commit -m "new version"
git push

popd