import { Post } from "@/types/posts"

export async function getPosts(): Promise<Post[]> {
  return [
    {
      id: 1,
      title: "Hello World",
      slug: "hello-world",
    },
    {
      id: 2,
      title: "Hello World 2",
      slug: "hello-world-2",
    },
  ]
}
