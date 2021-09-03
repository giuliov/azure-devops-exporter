$PROJECT_NAME   = 'azure-devops-exporter'
$GIT_TAG    = $(git describe --dirty --tags --always)
$GIT_COMMIT	= $(git rev-parse --short HEAD)

if ($PSVersionTable.Platform -eq 'Win32NT') {
  $OUTPUT_EXE="${PROJECT_NAME}.exe"
} else {
  $OUTPUT_EXE="${PROJECT_NAME}"
}

$env:CGO_ENABLED = 0
go build -a -ldflags '-X "main.gitTag=${GIT_TAG}" -X "main.gitCommit=${GIT_COMMIT}" -extldflags "-static"' -o ${PROJECT_NAME}.exe .
