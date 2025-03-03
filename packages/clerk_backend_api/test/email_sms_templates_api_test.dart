//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:clerk_backend_api/api.dart';
import 'package:test/test.dart';

/// tests for EmailSMSTemplatesApi
void main() {
  // final instance = EmailSMSTemplatesApi();

  group('tests for EmailSMSTemplatesApi', () {
    // Retrieve a template
    //
    // Returns the details of a template
    //
    //Future<Template> getTemplate(String templateType, String slug) async
    test('test getTemplate', () async {
      // TODO
    });

    // List all templates
    //
    // Returns a list of all templates. The templates are returned sorted by position.
    //
    //Future<List<Template>> getTemplateList(String templateType, { bool paginated, int limit, int offset }) async
    test('test getTemplateList', () async {
      // TODO
    });

    // Preview changes to a template
    //
    // Returns a preview of a template for a given template_type, slug and body
    //
    //Future<Object> previewTemplate(String templateType, String slug, { PreviewTemplateRequest previewTemplateRequest }) async
    test('test previewTemplate', () async {
      // TODO
    });

    // Revert a template
    //
    // Reverts an updated template to its default state
    //
    //Future<Template> revertTemplate(String templateType, String slug) async
    test('test revertTemplate', () async {
      // TODO
    });

    // Toggle the delivery by Clerk for a template of a given type and slug
    //
    // Toggles the delivery by Clerk for a template of a given type and slug. If disabled, Clerk will not deliver the resulting email or SMS. The app developer will need to listen to the `email.created` or `sms.created` webhooks in order to handle delivery themselves.
    //
    //Future<Template> toggleTemplateDelivery(String templateType, String slug, { ToggleTemplateDeliveryRequest toggleTemplateDeliveryRequest }) async
    test('test toggleTemplateDelivery', () async {
      // TODO
    });

    // Update a template for a given type and slug
    //
    // Updates the existing template of the given type and slug
    //
    //Future<Template> upsertTemplate(String templateType, String slug, { UpsertTemplateRequest upsertTemplateRequest }) async
    test('test upsertTemplate', () async {
      // TODO
    });
  });
}
