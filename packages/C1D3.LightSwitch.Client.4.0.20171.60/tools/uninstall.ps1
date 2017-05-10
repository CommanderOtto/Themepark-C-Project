param($installPath, $toolsPath, $package, $project)

$source = @"
    public class C1D3Uninstaller
    {
        public static void Uninstall(string htmlPath)
        {
            var strReader = new System.IO.StreamReader(htmlPath);
            var html = strReader.ReadToEnd();
            strReader.Close();

            html = removeRow(html, "Content/d3ls-light-4.0.20171.60.css");
            html = removeRow(html, "Scripts/d3.v3.js");
            html = removeRow(html, "Scripts/colorbrewer.v1.js");
            html = removeRow(html, "Scripts/d3ls-4.0.20171.60.js");

            html = html.Replace("\r\n\r\n    <!-- D3 Controls CSS -->", "");
            html = html.Replace("\r\n\r\n    <!-- D3 Controls JS -->", "");

            System.IO.File.SetAttributes(htmlPath, System.IO.FileAttributes.Normal);
            var writer = new System.IO.StreamWriter(htmlPath);
            writer.Write(html);
            writer.Close();
        }

        public static string removeRow(string source, string target)
        {
            var pos = source.IndexOf(target);
            if (pos != -1)
            {
                var startPos = source.LastIndexOf("\r\n", pos);
                if (startPos == -1) {
                    startPos = source.LastIndexOf("<", pos);
                }

                var endPos = source.IndexOf("\r\n", pos);
                if (startPos == -1)
                {
                    endPos = source.IndexOf(">", pos);
                }

                return source.Substring(0, startPos) + source.Substring(endPos);
            }
            return source;
        }
    }
"@

$default = $project.ProjectItems | Where-Object { $_.Name -eq "default.htm" }
if ($default -ne $null)
{

  if (-not $default.Saved)
  {
    $default.Save($default.Properties.Item("FullPath").Value)
  }

  Add-Type -TypeDefinition $source
  [C1D3Uninstaller]::Uninstall($default.Properties.Item("FullPath").Value)
}
