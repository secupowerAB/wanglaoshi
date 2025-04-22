# To learn more about how to use Nix to configure your environment
# see: https://firebase.google.com/docs/studio/customize-workspace
{ pkgs, ... }: {
  channel = "stable-24.05"; # or "unstable"
  # Use https://search.nixos.org/packages to  find packages
  packages = [
    pkgs.nodejs_20
  ];
  # Sets environment variables in the workspace
  env = {    
    #TODO Get a API key from https://g.co/ai/idxGetGeminiKey 
    GOOGLE_API_KEY = "TODO"; 
  };
  # search for the extension on https://open-vsx.org/ and use "publisher.id"
  idx.extensions = [
  ];
  idx.workspace = {
    # Runs when a workspace is first created with this `dev.nix` file
    onCreate = {
      npm-install = "npm ci --no-audit --prefer-offline --no-progress --timing";
      default.openFiles = [ "README.md" "static/index.html" "server.ts" ];
    };
    # To run something each time the workspace is (re)started, use the `onStart` hook
  };
  # preview configuration, identical to monospace.json
  idx.previews = {
    enable = true;
    previews = {
      web = {
        command = [ "npm" "run" "dev" ];
        manager = "web";
        env = {
          PORT = "$PORT";
          GENKIT_ENV = "dev";
        };
      };
    };
  };
}
