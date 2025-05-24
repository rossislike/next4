// Dummy imports
import { getPosts } from "@/lib/posts"
import { Post as PostUI } from "@/ui/post"
import { type Post } from "@/types/posts"

export default async function Page() {
  const posts = await getPosts()

  return (
    <ul>
      {posts.map((post: Post) => (
        <PostUI key={post.id} post={post} />
      ))}
    </ul>
  )
}
