# Typescript

## Loose autocomplete

Good for typing something that has predefined set of values, but also allows customization.

```typescript
type Size = 'small' | 'medium' | 'large' | (string & {});

const size: Size = '18px';
```

Specifying `string` only will "collapse" the type to `string` only, but having `string & {}` will still allow overrides.

## String union type instead of Enum

```typescript
// ❌ Bad
enum RequestStatusEnum {
  loading = 'loading'
  success = 'success'
  error = 'error'
}

// ✅ Good
type RequestStatusUnion = 'loading' | 'success' | 'error'
```

This approach has multiple advantages:

- No need to duplicate values as keys and as values.
  Not duplicating values in `enum` is not a good thing _(needs reference)_.
- No need to `import` enum explicitly.
- Type union does not compile into anything, as it's a type and not a value.

And some disadvantages:

- No ability to do `Object.keys`/`Object.values` to get all of the keys/values, as it's a type.

Popular questions:

- **Q**: Enum allows renaming values with the same key, why is not that an argument?

  **A**: Yes, that is correct. In most of the cases, key and value are equal.
  And renaming only key feels awkward.

  ```typescript
  // before
  enum ConnectStatus {
    ready = 'ready',
  }
  // after
  enum ConnectStatus {
    ready = 'loaded', // feels awkward and creates confusion
  }
  ```

  So key renaming is needed too to have consistency.
  And key renaming in enum is no different to renaming one of the string values in union type.

## Discriminated unions

[Discriminated unions][discuni] is a powerful TypeScript version of [Tagged unions][taguni] concept.

Unlike Haskell (data types), the tag, or discriminant, is just a property in each object type.
Each variant has an identical property with a different unit type.

```ts
// this example implements a state machine that has it's own value based on the type field
type State =
  | { type: "initial" }
  | { type: "loading", query: Record<string, string> }
  | { type: "ready", data: Record<string, unknown> }
  | { type: "error", error: Error }
```

## Dynamic type unions

TODO: to be added:

- type union from object
- type union from array

[discuni]: https://www.typescriptlang.org/docs/handbook/typescript-in-5-minutes-func.html#discriminated-unions
[taguni]: https://en.wikipedia.org/wiki/Tagged_union
