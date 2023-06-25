# Typescript

## Loose autocomplete

Good for typing something that has predefined set of values, but also allows customization.

```typescript
type Size = 'small' | 'medium' | 'large' | (string & {});

const size: Size = '18px';
```

Specifying `string` only will "collapse" the type to `string` only, but having `string & {}` will still allow overrides.
