function collectChildrenRecursive(children, element, depth) {
  if (depth <= 0) {
    return
  }
  if (element instanceof Loader) {
    children.push(element.item)
    collectChildrenRecursive(children, element.item, depth - 1)
  }
  for (var i = 0; i < element.children.length; ++i) {
    children.push(element.children[i])
    collectChildrenRecursive(children, element.children[i], depth - 1)
  }
  return children
}
