export default function BlogLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <>
      <div>Blog Layout</div>
      <section>{children}</section>
    </>
  )
}
