local propmts = {
  Explain = "Échale un ojo y cuéntame cómo funciona este código, con todos los detalles chidos, amigo.",
  Review = "Dale una revisada a este código y dime qué tal, ¿qué le cambiarías para que quede perrón?",
  Test = "Explícame cómo funciona este código y aviéntate unas pruebas unitarias, así bien tranqui.",
  Refactor = "Dale una arreglada a este código, que quede más limpio y rápido, como para presumirlo, amigo.",
  FixCode = "Corrige este código para que jale chido, sin fallas ni cosas raras, amigo.",
  BetterNaming = "Échame la mano con unos nombres más cool para las variables y funciones, que se vean pro, amigo.",
  Documentation = "Hazle una documentación chida a este código, como para que hasta tu abuelita lo entienda.",
  Optimize = "Dale un boost a este código, que corra más rápido y eficiente, como un campeón, amigo.",
  -- Text prompts
  Summarize = "Summarize the following text in a concise manner.",
  Spelling = "Check the following text for spelling errors and suggest corrections.",
  Wording = "Suggest better wording for the following text to improve clarity and readability.",
  Context = "Rewrite the following text to make it more concise",
}

local system_prompt =
"Eres un asistente de inteligencia artificial con conocimientos avanzados en ingeniería de software y arquitectura de sistemas. Actúas como un arquitecto de software experimentado, pero tu estilo es casual, amigable y te expresas usando modismos mexicanos, como si estuvieras platicando con un cuate. Siempre que sea apropiado, utiliza el nombre de la persona que te consulta: Edgar. Tus áreas de especialización incluyen: - Patrones de arquitectura de software (microservicios, event-driven, CQRS, hexagonal, etc.) - Prácticas y herramientas DevOps (CI/CD, infraestructura como código, automatización, monitoreo, contenedores, Kubernetes, etc.) - Tecnologías de mensajería y streaming como Apache Kafka y RabbitMQ. - Diseño y análisis de sistemas distribuidos y escalables. - Seguridad y buenas prácticas en desarrollo de software. Tus funciones principales son: - Explicar cualquier tecnología, patrón o concepto relacionado con ingeniería de software o DevOps de forma sencilla y cercana, usando modismos mexicanos cuando sea posible. - Proporcionar guías prácticas y paso a paso para hacer experimentos, pruebas de concepto o laboratorios sencillos. - Recomendar buenas prácticas, patrones y herramientas según el contexto de Edgar. - Responder siempre de manera clara, relajada y útil, como si estuvieras ayudando a un amigo mexicano. Cuando recibas una consulta, asegúrate de comprender el contexto y el nivel de experiencia de Edgar. Si hace falta, pide información adicional, pero siempre manteniendo el tono amistoso, relajado y usando modismos mexicanos. Tu objetivo es ayudar a Edgar a entender, diseñar e implementar soluciones robustas y escalables, priorizando la claridad, las buenas prácticas y la aplicabilidad en el mundo real, ¡pero sin perder el buen cotorreo!"


return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    opts = {
      file_types = { "markdown", "copilot-chat" },
    },
    ft = { "markdown", "copilot-chat" },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      system_prompt = system_prompt,
      prompts = propmts,
      window = {
        width = 0.5,
      },
      model = "gpt-4o",
      question_header = "  Ask Copilot ",
      answer_header = "  Copilot ",
      autocomplete = true,
    },
    keys = {
      { "<leader>ac", ":CopilotChat<CR>",         mode = "n", desc = "CopilotChat - Open chat" },
      { "<leader>ae", ":CopilotChatExplain<CR>",  mode = "v", desc = "CopilotChat - Explain code" },
      { "<leader>ar", ":CopilotChatReview<CR>",   mode = "v", desc = "CopilotChat - Review code" },
      { "<leader>aR", ":CopilotChatRefactor<CR>", mode = "v", desc = "CopilotChat - Refactor code" },
      { "<leader>af", ":CopilotChatFix<CR>",      mode = "v", desc = "CopilotChat - Fix Diagnostic" },
      { "<leader>ao", ":CopilotChatOptimize<CR>", mode = "v", desc = "CopilotChat - Optimize Code" },
      { "<leader>am", ":CopilotChatCommit<CR>",   mode = "n", desc = "CopilotChat - Generate commit message for all changes" },
      { "<leader>at", ":CopilotChatToggle<CR>",   mode = "n", desc = "CopilotChat - Toggle" },
      { "<leader>a?", ":CopilotChatModels<CR>",   mode = "n", desc = "CopilotChat - Select Models" },
      { "<leader>za", ":CopilotChatAgents<CR>",   mode = "n", desc = "CopilotChat - Select Agents" },
      {
        "<leader>ai",
        function()
          local input = vim.fn.input("Ask Copilot: ")
          if input ~= "" then
            vim.cmd("CopilotChat " .. input)
          end
        end,
        desc = "CopilotChat - Ask input",
      },
      {
        "<leader>aa",
        function()
          local agent = vim.fn.input("Select Agent: ")
          local question = vim.fn.input("Ask Copilot (Agent Mode): ")
          if agent ~= "" and question ~= "" then
            vim.cmd("CopilotChatAgents " .. agent)
            vim.cmd("CopilotChat " .. question)
          end
        end,
        desc = "CopilotChat - Ask with Agent",
      },
    },
  },
}
