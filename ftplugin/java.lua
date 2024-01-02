local jdtls_dir = vim.fn.stdpath('data') .. '/mason/packages/jdtls'
local config_dir = jdtls_dir .. '/config_win'
local plugins_dir = jdtls_dir .. '/plugins/'
local path_to_jar = plugins_dir .. 'org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'
local path_to_java_dap = 'C:/Users/tejpa/java_files/java-debug/com.microsoft.java.debug.plugin/target/'

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
    return
end

local status, jdtls = pcall(require, "jdtls")
if not status then
  return
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath('data') .. '/site/java/workspace-root/' .. project_name
os.execute("mkdir " .. workspace_dir)

--Main Config

local config = {
    cmd = {
        'C:/Program Files/Java/jdk-19/bin/java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Xms1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

        '-jar', path_to_jar,
        '-configuration',  config_dir,
        '-data', workspace_dir,
    },

    root_dir = root_dir,

    settings = {
        java = {
            home = 'C:/Program Files/Java/jdk-19',
            eclipse = {
                downloadSources = true,
            },
            configuration = {
                updateBuildConfiguration = "interactive",
                runtimes = {
                    {
                        name = "JavaSE-19",
                        path = "C:/Program Files/Java/jdk-19",
                    }
                }
            },
            maven = {
                downloadSOurces = true,
            },
            implementationsCodeLens = {
                enabled = true,
            },
            referencesCodeLens = {
                enabled = true,
            },
            refereces = {
                includeDecompiledSources = true,
            },
            inlayHints = {
                parameterNames = {
                  enabled = "all", -- literals, all, none
                },
            },
            format = {
                enabled = true,
                settings = {
                    url = vim.fn.stdpath "config" .."/lang-servers/intellij-java-google-style.xml",
                    profile = "GoogleStyle",
                },
            },
        },

        signatureHelp = { enabled = true },

        completion = {
            favoriteStaticMembers = {
                "org.hamcrest.MatcherAssert.assertThat",
                "org.hamcrest.Matchers.*",
                "org.hamcrest.CoreMatchers.*",
                "org.junit.jupiter.api.Assertions.*",
                "java.util.Objects.requireNonNull",
                "java.util.Objects.requireNonNullElse",
                "org.mockito.Mockito.*",
            },
            importOrder = {
                "java",
                "javax",
                "JavaSE",
                "com",
                "org"
            },
        },
        contentProvider = { preferred = "fernflower" },
        extendedClientCapabilities = extendedClientCapabilities,

        sources = {
            organizeImports = {
                startThreshold = 9999,
                staticStarThreshold = 9999,
            },
        },
        codeGeneration = {
            toString = {
                template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
            },
            useBlocks = true,
        },

        flags = {
            allow_incremental_sync = true,
        },
        init_options = {
            bundles = {
                -- vim.fn.glob(path_to_java_dap .. "com.microsoft.java.debug.plugin-0.50.0.jar", 1)
                vim.fn.glob("C:/Users/tejpa/java_files/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.50.0.jar", 1)
            },
        },
    }
}


config['on_attach'] = function(client, bufnr)
  require'user.keymaps'.map_java_keys(bufnr);
end

require('jdtls').start_or_attach(config)
