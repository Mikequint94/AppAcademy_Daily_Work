export const getBenches = () => {
  return $.ajax({
    method: 'GET',
    url: '/api/benches',
    error: (err) => console.log(err)
  });
};
