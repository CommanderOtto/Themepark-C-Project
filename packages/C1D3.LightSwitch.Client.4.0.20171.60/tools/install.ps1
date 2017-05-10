param($installPath, $toolsPath, $package, $project)

$source = @"
    public class C1D3Installer
    {
        public static void Install(string htmlPath)
        {
            var strReader = new System.IO.StreamReader(htmlPath);
            var html = strReader.ReadToEnd();
            strReader.Close();

            var lastLinkPos = html.LastIndexOf("<link", html.LastIndexOf("<link"));
            var cssPos = html.IndexOf("\r\n", lastLinkPos);
            var jsPos = html.LastIndexOf("\r\n", html.LastIndexOf("Scripts/Generated/generatedAssets.js"));

            if (cssPos != -1 && jsPos != -1)
            {
                var headPart = html.Substring(0, cssPos);
                var bodyPart = html.Substring(cssPos, jsPos - cssPos);
                var endPart = html.Substring(jsPos);

                var isChanged = false;
                if (headPart.IndexOf("Content/d3ls-light-4.0.20171.60.css") == -1)
                {
                    headPart = headPart + "\r\n\r\n    <!-- D3 Controls CSS -->";
                    headPart = headPart + "\r\n    <link rel=\"stylesheet\" type=\"text/css\" href=\"Content/d3ls-light-4.0.20171.60.css\" />";
                    isChanged = true;
                }

                if (bodyPart.IndexOf("Scripts/d3ls-4.0.20171.60.js") == -1)
                {
                    bodyPart = bodyPart + "\r\n    <!-- D3 Controls JS -->";
                    bodyPart = bodyPart + "\r\n    <script type=\"text/javascript\" src=\"Scripts/d3.v3.js\"></script>";
                    bodyPart = bodyPart + "\r\n    <script type=\"text/javascript\" src=\"Scripts/colorbrewer.v1.js\"></script>";
                    bodyPart = bodyPart + "\r\n    <script type=\"text/javascript\" src=\"Scripts/d3ls-4.0.20171.60.js\"></script>\r\n";
                    isChanged = true;
                }

                if (isChanged)
                {
                    System.IO.File.SetAttributes(htmlPath, System.IO.FileAttributes.Normal);
                    var writer = new System.IO.StreamWriter(htmlPath);
                    writer.Write(headPart);
                    writer.Write(bodyPart);
                    writer.Write(endPart);
                    writer.Close();
                }
            }
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
  [C1D3Installer]::Install($default.Properties.Item("FullPath").Value)
}
