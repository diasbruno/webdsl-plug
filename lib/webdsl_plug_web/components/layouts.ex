defmodule WebdslPlugWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered as part of the
  application router. The "app" layout is set as the default
  layout on both `use WebdslPlugWeb, :controller` and
  `use WebdslPlugWeb, :live_view`.
  """
  use WebdslPlugWeb, :html

  embed_templates "layouts/*"
end
