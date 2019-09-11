(asdf:defsystem :grammar-translator
  :class :package-inferred-system 
  :description "Context sensitive (maybe) or at least any context free grammar translator to grammar for LL(1) parser"
  :version "0.0.1"
  :author "Oleksii Vovchok"
  :depends-on (:grammar-translator/core))
