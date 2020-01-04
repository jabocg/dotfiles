syn region  javaScriptStringG	       start=+`+  skip=+\\\\\|\\`+  end=+`\|$+	contains=javaScriptSpecial,@htmlPreproc
hi def link javaScriptStringG		String
