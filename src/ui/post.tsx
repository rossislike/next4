import { type Post } from "@/types/posts"
import Link from "next/link"

interface PostProps {
  post: Post
}

export async function Post({ post }: PostProps) {
  return (
    <ul>
      <li key={post.slug}>
        <Link href={`/blog/${post.slug}`}>{post.title}</Link>
      </li>
    </ul>
  )
}
