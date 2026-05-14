# Schema and Config Customization

Use this reference when the default `spec-driven` workflow is not enough.

## Start with config before custom schemas

First consider `openspec/config.yaml`:

- default schema
- shared project context
- per-artifact rules

This is cheaper than inventing a new schema.

## Create a custom schema when

- artifact order must change
- artifact types must change
- the team repeatedly needs a workflow the default cannot express clearly

## Good customization sequence

1. tune `openspec/config.yaml`
2. fork `spec-driven`
3. edit only the minimum needed
4. validate the schema before using it broadly
