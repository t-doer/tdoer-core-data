-- After importing tables, rename the tables:

RENAME TABLE
  fw_application to bb_fw_application,
  fw_application_resource to bb_fw_application_resource,
  fw_application_service_url to bb_fw_application_service_url,
  fw_context_application to bb_fw_context_application,
  fw_context_role to bb_fw_context_role,
  fw_context_role_authority to bb_fw_context_role_authority,
  fw_context_type to bb_fw_context_type,
  fw_navigation_item to bb_fw_navigation_item,
  fw_product to bb_fw_product,
  fw_product_application to bb_fw_product_application,
  fw_product_context to bb_fw_product_context,
  fw_tenant to bb_fw_tenant,
  fw_tenant_product to bb_fw_tenant_product,
  user to bb_user,
  organization to bb_organization,
  organization_member to bb_organization_member,
  organization_member_role to bb_organization_member_role;