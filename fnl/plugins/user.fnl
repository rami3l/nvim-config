[
 ;; Disable bundled plugins.
 {1 :max397574/better-escape.nvim :enabled false}

 ;; Add new user plugins.

 ;; Neovim API helper
 {1 :folke/neodev.nvim :lazy true}

 ;; Language support
 { 1 :Olical/nfnl :ft :fennel}
 { 1 :beardedsakimonkey/nvim-antifennel :ft :lua}
 {1 :gpanders/nvim-parinfer
  :dependencies {1 :AstroNvim/astrocore
                 :opts {:options {:g {:parinfer_comment_chars ";;"
                                      :parinfer_force_balance true}}}}}

 {1 :Julian/lean.nvim
  :ft :lean
  :opts {:lsp {:on_attach (. (require :astrolsp) :on_attach)} :mappings true}}

 ;; UI enhancements
 {1 :keaising/im-select.nvim
  :event "User Astrofile"
          :config (fn [_ opts]
                    (when (= (string.len vim.fn.has :macunix) 1)
                      (set opts.default_im_select :com.apple.keylayout.US)
                      (set opts.default_command :macism))
                    ((. (require :im_select) :setup) opts))}

 {1 :nvim-treesitter/nvim-treesitter-context
  :event "User Astrofile"
  :opts {:max_lines 2}}]

