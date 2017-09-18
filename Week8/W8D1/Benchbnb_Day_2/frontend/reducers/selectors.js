export const asArray = ({ benches }) => (
  Object.keys(benches).map(key => benches[key])
);
