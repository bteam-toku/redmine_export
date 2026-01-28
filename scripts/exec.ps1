# バッチ実行関数
function Invoke-Batch {
    param (
        [string]$project
    )

    $fullCurrentPath = Get-Location
    $fullCustomizePath = Join-Path $fullCurrentPath "customizes"

    Set-Location -Path $PSScriptRoot
    docker run -it --rm `
        -v "$($fullCurrentPath):/data" `
        -v "$($fullCustomizePath):/app/src/redmine_export/customizes" `
        ghcr.io/bteam-toku/redmine_export:latest $project
}

# 一つ上の親ディレクトリをカレントフォルダリに設定（環境に合わせて変更してください）
Set-Location -Path (Join-Path $PSScriptRoot "..")

# # redmine_exportの実行
# Invoke-Batch -project "project_name"
